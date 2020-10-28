class Rating < ActiveHash::Base
  self.data = [
    { id: 1, number: '--' },
    { id: 2, number: '1' },
    { id: 3, number: '2' },
    { id: 4, number: '3' },
    { id: 5, number: '4' },
    { id: 6, number: '5' },
  ]
end
