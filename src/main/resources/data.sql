INSERT INTO client (
    client_name,
    client_uri,
    client_phone,
    client_street_address,
    client_city,
    client_state,
    client_zip,
    client_id
) VALUES (
    'Aquent',
    'Aquent.com',
    '7812443804',
    'asdfasdfas lane',
    'Boston',
    'MA',
    '01907',
    '10'
), (
    'Flippers',
    'citylight.com',
    '9785626254',
    'MoneyBags lane',
    'Danvers',
    'MA',
    '01935',
    '11'
);

INSERT INTO person (
    first_name,
    last_name,
    email_address,
    street_address,
    city,
    state,
    zip_code,
    client_id
) VALUES (
    'John',
    'Smith',
    'fake1@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    '-1'
), (
    'Timmy',
    'Deer',
    'fake2@aquent.com',
    '123 Any St.',
    'Asheville',
    'NC',
    '28801',
    '-1'
), (
    'Robert',
    'Seymour',
    'seymr1@gmail.com',
    'Spring Road.',
    'Boston',
    'MA',
    '02115',
    '-1'
);

