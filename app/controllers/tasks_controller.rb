class TasksController < ApplicationController
    #before_action :authenticate_user!, only:[:new_event, :create_event]

    def redirect
      session[:space_id] = params[:space_id]
      session[:id] = params[:id]
      
      if session[:authorization] != nil && session[:authorization]["access_token"]
        redirect_to calendars_path
      else
        client = Signet::OAuth2::Client.new(client_options)
        redirect_to client.authorization_uri.to_s
      end
    end

    def callback
      client = Signet::OAuth2::Client.new(client_options)
      client.code = params[:code]
      response = client.fetch_access_token!   
      session[:authorization] = response
      redirect_to calendars_url
    end

    def calendars
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      # @calendar = service.get_calendar('primary')
      @space = Space.find(session[:space_id])
      @channels = current_user.channels.where(space_id: @space.id, direct_message: false).order("ID ASC")
      @lobby_channel = Space.find(@space.id).channels.find_by(is_public: 'lobby_channel')
      @channel = current_user.channels.find(session[:id]) 
      spaces = current_user.spaces
      space_public_channels = []
        spaces.each do |space|
          space_public_channels << space.channels.lobby_channels
        end
      @space_public_channels = space_public_channels.flatten

      rescue Google::Apis::AuthorizationError
        response = client.refresh!
        session[:authorization] = session[:authorization].merge(response)
      retry
    end

    def calendear_events
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client
      response = service.list_events('primary',
        max_results: 15,
        single_events: true,
        order_by: 'startTime',
        time_min: Time.now.iso8601)
        
        array = []
        response.items.each do |event|
          array << event
        end
        render json: array
    end

    def new_event
      @task = Task.new(user_id: current_user.id)
    end
    
    def create_event
      @task = Task.new(task_params)
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])
  
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client

        event = Google::Apis::CalendarV3::Event.new({
          start: Google::Apis::CalendarV3::EventDateTime.new(date: params["task"]["start_date"].to_date),
          end: Google::Apis::CalendarV3::EventDateTime.new(date: params["task"]["end_date"].to_date),
          summary: params["task"]["title"],
          description: params["task"]["description"],
          location: params["task"]["location"],
        })

        service.insert_event('primary', event)
        
        @task.save #先不管時區問題
        redirect_to calendars_path
      end
    
    private
    def client_options
    {
        client_id: ENV['google_client_id'],
        client_secret: ENV['google_client_secret'],
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: callback_url,
        #additional_parameters: {s: params[:s]},
    }
    end

    def task_params
      params.require(:task).permit(:user_id, :title, :description, :location, :start_date, :end_date)
    end
end

