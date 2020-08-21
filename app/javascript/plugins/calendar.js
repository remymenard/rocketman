import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('turbolinks:load', function() {
  const calendarEl = document.getElementById('calendar');
  if (calendarEl != null) {
  const calendar = new Calendar(calendarEl, {
    events: '/owner/orders/index_json',
    height: 650,
    plugins: [ dayGridPlugin ],
  initialView: 'dayGridMonth'
  });
  calendar.render();
}
});
