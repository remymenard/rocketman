import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new Calendar(calendarEl, {
    events: '/owner/orders/list',
    height: 650,
    plugins: [ dayGridPlugin ],
  initialView: 'dayGridMonth'
  });
  calendar.render();
});
