module HasCarrier
  extend ActiveSupport::Concern
  included do
    enum carrier: { aa: 1, ay: 2, ba: 3, cx: 4, ib: 5, jl: 6,
                    la: 7, mh: 8, qf: 9, qr: 10, rj: 11,
                    s7: 12, ul: 13, }, _prefix: true

    validates :carrier, :inclusion => {:in => carriers.keys}
    def carrier_upcase
      carrier.upcase
    end
  end
end