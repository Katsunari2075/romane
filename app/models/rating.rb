class Rating < ActiveHash::Base
  self.data = [
    { id: 1, number: '--' },
    { id: 2, number: '★' },
    { id: 3, number: '★★' },
    { id: 4, number: '★★★' },
    { id: 5, number: '★★★★' },
    { id: 6, number: '★★★★★' },
  ]
end
