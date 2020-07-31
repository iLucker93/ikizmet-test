class Precalculate < ApplicationRecord
  enum type_list: {
    highest_revenue: 0,
    lowest_revenue: 1,
    least_revenue: 2,
    total_revenue: 3
  }
end
