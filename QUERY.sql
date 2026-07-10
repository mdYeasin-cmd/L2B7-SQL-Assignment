-- Active: 1783648639069@@127.0.0.1@5432@footballticketbookingsystem

-- Query 1
SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';

-- Query 2
SELECT user_id, full_name, email
FROM users
WHERE full_name LIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';

-- Query 3
SELECT 
  booking_id,
  user_id,
  match_id,
  COALESCE(payment_status, 'Action Required') AS systematic_status
FROM bookings
WHERE payment_status IS NULL;

-- Query 4
SELECT 
  b.booking_id,
  u.full_name,
  m.fixture,
  b.total_cost
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN matches m ON b.match_id = m.match_id;
