<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Schedule Booking</title>
        <link rel="stylesheet" href="styles.css">
        <style>
            .schedule-container {
                margin: 0 auto;
                width: 80%;
                text-align: center;
            }

            .schedule-table {
                width: 100%;
                border-collapse: collapse;
            }

            .schedule-table th, .schedule-table td {
                border: 1px solid #ccc;
                padding: 10px;
                width: 100px;
                text-align: center;
            }

            .time-slot {
                cursor: pointer;
            }

            .time-slot.selected {
                background-color: #76c7c0;
            }

            .time-slot.unavailable {
                background-color: #ff4d4d;
                cursor: not-allowed;
            }
        </style>
    </head>

    <body>
        <a href="home">Home</a>
        <div class="schedule-container">
            <% int week=Integer.parseInt(request.getParameter("week"));  %>
            <button onclick="location.href = 'schedule?week=<%= week-1 %>&field=${field}&base=${base}'">Previous Week</button>
            <button onclick="location.href = 'schedule?week=<%= week+1 %>&field=${field}&base=${base}'">Next Week</button>
            <p style="font-size: 120%;display: flex;justify-content: center;color:red">${requestScope.error}</p>
            <form action="datsan?field=${field}" method="post" id="scheduleForm">
                <table class="schedule-table">
                    <thead>
                        <tr>
                            <th>Time</th>
                                <% 
                                    Calendar calendar = (Calendar) request.getAttribute("calendar");
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); 
                                    Date today = new Date();
                                    for (int i = 0; i < 7; i++) {
                                        Date date = calendar.getTime();
                                        String formattedDate = sdf.format(date);
                                        boolean isPastDate = date.before(today);
                                %>
                            <th>
                                <%= new SimpleDateFormat("EEE").format(date) %><br>
                                <%= formattedDate %>
                            </th>
                            <% 
                                    calendar.add(Calendar.DAY_OF_MONTH, 1); 
                                } 
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String[] times = {"07:00","08:00", "09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00", "20:00", "21:00", "22:00"};
                            ArrayList<String> rented=(ArrayList<String>) request.getAttribute("rented");
                            ArrayList<String> unavailableSlots = new ArrayList<>();
                            
                            for (String time : times) {
                                Calendar rowCalendar = Calendar.getInstance();
                                rowCalendar.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
                                rowCalendar.add(Calendar.DAY_OF_MONTH, week*7);
                        %>
                        <tr>
                            <td><%= time %></td>
                            <% 
                                for (int i = 0; i < 7; i++) {
                                    String customer="";
                                    Date date = rowCalendar.getTime();
                                    String formattedDate = new SimpleDateFormat("MM-dd-yyyy").format(date);
                                    int hourOfDay = rowCalendar.get(Calendar.HOUR_OF_DAY);
                                    String slotId = formattedDate + "_" + time;
                                    if(date.before(today)){ unavailableSlots.add(slotId);}
                                    else if(formattedDate.equals(new SimpleDateFormat("MM-dd-yyyy").format(today)))
                                    {
                                    if(hourOfDay>=Integer.parseInt(time.split(":")[0])){
                                    unavailableSlots.add(slotId);
                                }
                                }
                                    for(String s:rented){if(slotId.equals(s.split(" ")[0])) {unavailableSlots.add(slotId);customer=s.split(" ")[1];}    } 
                                    boolean isUnavailable = unavailableSlots.contains(slotId); // Check against unavailable slots
                            %>
                            <td class="time-slot <%= (isUnavailable) ? "unavailable" : "" %>" data-time="<%= time %>" data-day="<%= i %>" data-date="<%= formattedDate %>"><%= customer %></td>
                            <% 
                                    rowCalendar.add(Calendar.DAY_OF_MONTH, 1);
                                } 
                            %>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <button type="submit">Submit Booking</button>
                <input type="hidden" name="selectedSlots" id="selectedSlots">
            </form>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                $(document).ready(function () {
                    $('.time-slot').click(function () {
                        if ($(this).hasClass('unavailable'))
                            return;
                        $(this).toggleClass('selected');
                    });
                    $('#scheduleForm').submit(function (event) {
                        event.preventDefault();
                        let selected = [];
                        $('.time-slot.selected').each(function () {
                            let dayDate = $(this).attr('data-date'); // Get date
                            let time = $(this).attr('data-time'); // Get time
                            selected.push(dayDate + "_" + time); // Combine date and time
                        });
                        $('#selectedSlots').val(selected.join(',')); // Update value for selectedSlots
                        this.submit();
                    });
                });
        </script>
    </body>
</html>
