COMMENT ON TABLE person_discounts IS 'Персональные скидки клиентов в разрезе пиццерий, рассчитанные на основе истории заказов';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи о скидке';
COMMENT ON COLUMN person_discounts.person_id IS 'Клиент, которому назначена скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Пиццерия, в которой действует данная скидка';
COMMENT ON COLUMN person_discounts.discount IS 'Размер персональной скидки клиента в процентах (0–100)';