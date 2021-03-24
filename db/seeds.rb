User.create!(
  [
    {name: 'Alycia Rojas', email: 'alycia@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'George Shammah', email: 'george@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Ismael Bruno', email: 'ismael@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Grace Temi', email: 'temi@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Abdul Kaliq', email: 'abdul@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Jordan Kaweesi', email: 'ordon@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Akello Joan', email: 'joan@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Elizabeth Kirabo', email: 'liz@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Agatha Gwth', email: 'agatha@gmail.com', password: '123456', password_confirmation: '123456'},
    {name: 'Suzan Oboo', email: 'suzan@gmail.com', password: '123456', password_confirmation: '123456'},
  ]
)

Event.create!(
  [
    {title: 'First Event', desc: 'The Best Fashoin Show in Town', venue: 'Kampala', event_date: '2021-06-27', event_time: '20:34:00.000000000 +0000', creator_id: 1},
    {title: 'Dev Conference', desc: 'The Annual Ruby on Rails Conference', venue: 'Tokyo', event_date: '2021-07-27', event_time: '20:34:00.000000000 +0000', creator_id: 2},
    {title: 'PHP Past Conf', desc: 'Why PHP is still the best', venue: 'Pakistan', event_date: '2021-01-27', event_time: '20:34:00.000000000 +0000', creator_id: 3},
    {title: 'Lisp Conference', desc: 'The father of all Functional Programming', venue: 'USA', event_date: '2021-02-27', event_time: '20:34:00.000000000 +0000', creator_id: 4},
  ]
)
