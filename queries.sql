-- View complete booking data
SELECT * FROM booking_data;

-- Total bookings per route
SELECT route, SUM(seats_booked) AS total_seats_booked
FROM booking_data
GROUP BY route;

-- Seat utilization percentage
SELECT bus_id, route,
       (SUM(seats_booked) * 100.0 / SUM(total_seats)) AS utilization_percentage
FROM booking_data
GROUP BY bus_id, route;

-- Identify peak booking dates
SELECT date, SUM(seats_booked) AS daily_bookings
FROM booking_data
GROUP BY date
ORDER BY daily_bookings DESC;

-- Cancellation analysis
SELECT route, SUM(cancellation) AS total_cancellations
FROM booking_data
GROUP BY route;
