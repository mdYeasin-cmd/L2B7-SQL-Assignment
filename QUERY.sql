-- Active: 1783648639069@@127.0.0.1@5432@footballticketbookingsystem

-- Query 1
SELECT match_id, fixture, base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
  AND match_status = 'Available';