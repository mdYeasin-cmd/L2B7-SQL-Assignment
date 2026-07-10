SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';

SELECT user_id, full_name, email
FROM users
WHERE full_name LIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';

SELECT 
  booking_id,
  user_id,
  match_id,
  COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;

SELECT 
  b.booking_id,
  u.full_name,
  m.fixture,
  b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;

SELECT 
  u.user_id,
  u.full_name,
  b.booking_id
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
ORDER BY u.user_id, b.booking_id;

SELECT 
  booking_id,
  match_id,
  total_cost
FROM bookings
WHERE total_cost > (
  SELECT AVG(total_cost)
  FROM bookings
);

SELECT 
  match_id,
  fixture,
  base_ticket_price
FROM matches
ORDER BY base_ticket_price DESC
LIMIT 2 OFFSET 1;