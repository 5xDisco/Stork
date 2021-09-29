import { Controller } from "stimulus";
import { Calendar } from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';

export default class extends Controller {

  

    connect(){

          
          var calendarEl = document.getElementById('calendar');
          const calendar = new Calendar(calendarEl, {
              plugins: [ interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin ],
              events: function( fetchInfo, successCallback, failureCallback ){
                var events = [];
                $.ajax({
                    type:"GET",
                    url:"/events.json",
                    dataType:"json",
                    success:function(data){
                      events = []
                      data.forEach((i)=>{ 
                        events.push({
                          title: i.summary,
                          start: i.start["date"] ?? i.start["date_time"],
                          end: i.end["date"] ?? i.end["date_time"],
                          url: i.html_link,
                        })
                       });
                      successCallback(events);
                    },
                  })
                },
              eventClick: function(info) {
                info.jsEvent.preventDefault(); // don't let the browser navigate
            
                if (info.event.url) {
                  window.open(info.event.url);
                }
              },
              
            },

            );
          // call api
          calendar.render();
    }
}
