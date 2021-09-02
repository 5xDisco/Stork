module ChannelsHelper
    def has_create_error(errors)
        if errors != nil && errors.length > 0
            true
        else
            false
        end
    end
end
