import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

function loadCalendar() {
  const calendarEl = document.getElementById('calendar');
  if (calendarEl != null) {
  let calendar = new Calendar(calendarEl, {
    events: '/owner/orders/index_json',
    height: 650,
    plugins: [ dayGridPlugin ],
    initialView: 'dayGridMonth'
  });
  calendar.render();
}
// calendarEl.fullCalendar('delete')
}


