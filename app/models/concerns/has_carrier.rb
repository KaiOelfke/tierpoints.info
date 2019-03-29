module HasCarrier
  extend ActiveSupport::Concern
  included do
    enum carrier: { ba: 1, aa: 2, ay: 3, cx: 4, qr: 5, ul: 6, qf: 7,
                  mh: 8, jl: 9, ib: 10, la: 11, rj: 12, s7: 13 }, _prefix: true
  end
end