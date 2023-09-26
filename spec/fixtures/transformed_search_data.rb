# frozen_string_literal: true

TRANSFORMED_SEARCH_DATA = {
  journey_options: [
    {
      connections: [
        {
          end_time: '2022-06-02T12:41:00+02:00',
          fares: [
            {
              currency: 'GBP',
              name: 'Standard Class',
              price: '10.00'
            },
            {
              currency: 'GBP',
              name: 'Standard Premier',
              price: '11.00'
            }
          ],
          finish: 'Finish Station 1',
          start: 'Start Station 1',
          start_time: '2022-06-02T09:23:00+01:00',
          train_name: 'Train Name A'
        },
        {
          end_time: '2022-06-02T20:17:00+02:00',
          fares: [
            {
              currency: 'GBP',
              name: 'Standard Class',
              price: '9.90'
            },
            {
              currency: 'GBP',
              name: 'First Class',
              price: '18.90'
            }
          ],
          finish: 'Finish Station 2',
          start: 'Start Station 2',
          start_time: '2022-06-02T13:56:00+02:00',
          train_name: 'Train Name B'
        }
      ],
      id: 'ID 1'
    },
    {
      connections: [
        {
          end_time: '2022-06-02T12:54:00+02:00',
          fares: [
            {
              currency: 'GBP',
              name: 'Standard Class',
              price: '18.00'
            },
            {
              currency: 'GBP',
              name: 'Standard Premier',
              price: '27.00'
            }
          ],
          finish: 'Finish Station 1',
          start: 'Start Station 1',
          start_time: '2022-06-02T09:45:00+01:00',
          train_name: 'Train Name C'
        },
        {
          end_time: '2022-06-02T20:50:00+02:00',
          fares: [
            {
              currency: 'GBP',
              name: 'Standard Class',
              price: '19.00'
            },
            {
              currency: 'GBP',
              name: 'First Class',
              price: '26.00'
            }
          ],
          finish: 'Finish Station 2',
          start: 'Start Station 2',
          start_time: '2022-06-02T14:11:00+02:00',
          train_name: 'Train Name D'
        }
      ],
      id: 'ID 2'
    }
  ]
}.freeze
