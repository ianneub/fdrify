require 'time'
require 'csv'

module FlightData
	class Point
		attr_accessor :time, :lat, :long, :altitude, :heading, :speed, :start_time

		def initialize(time:, lat:nil, long:nil, altitude:nil, heading:nil, speed:nil)
			self.time = time
			self.lat = lat
			self.long = long
			self.altitude = altitude
			self.heading = heading
			self.speed = speed
		end

		def to_a
			out = []
			out << 'DATA'
			out << (time.to_time.to_r - start_time.to_time.to_r).to_f.round(3)
			out << 0.0 # temp
			out << long.to_f.round(3)
			out << lat.to_f.round(3)
			out << altitude.to_f.round(3)
			out << 0.0 # radio altimiter
			out << 0.0 # aileron deflection
			out << 0.0 # elev ratio
			out << 0.0 # rudd ratio
			out << 0.0 # ptch deg
			out << 0.0 # roll deg
			out << heading.to_f.round(3) # hdng TRUE
			out << speed.to_f.round(3) # speed KIAS
			out << 0.0 # VVI ft/mn
			out << 0.0 # slip deg
			out << 0.0 # turn deg
			out << 0.0 # mach #
			out << 0.0 # AOA deg
			out << 0.0 # stall warn
			out << 0.0 # flap rqst
			out << 0.0 # flap actul
			out << 0.0 # slat ratio
			out << 0.0 # sbrk ratio
			out << 0.0 # gear handl
			out << 0.0 # Ngear down
			out << 0.0 # Lgear down
			out << 0.0 # Rgear down
			out << 0.0 # elev trim
			out << 0.0 # NAV–1 frq
			out << 0.0 # NAV–2 frq
			out << 0.0 # NAV–1 type
			out << 0.0 # NAV–2 type
			out << 0.0 # OBS–1 deg
			out << 0.0 # OBS–2 deg
			out << 0.0 # DME–1 nm
			out << 0.0 # DME–2 nm
			out << 0.0 # NAV–1 h-def
			out << 0.0 # NAV–2 h-def
			out << 0.0 # NAV–1 n/t/f
			out << 0.0 # NAV–2 n/t/f
			out << 0.0 # NAV–1 v-def
			out << 0.0 # NAV–2 v-def
			out << 0.0 # OM over
			out << 0.0 # MM over
			out << 0.0 # IM over
			out << 0.0 # f-dir 0/1
			out << 0.0 # f-dir ptch
			out << 0.0 # f-dir roll
			out << 0.0 # ktmac 0/1
			out << 0.0 # throt mode
			out << 0.0 # hdg mode
			out << 0.0 # alt mode
			out << 0.0 # hnav mode
			out << 0.0 # glslp mode
			out << 0.0 # back mode
			out << 0.0 # speed selec
			out << 0.0 # hdg selec
			out << 0.0 # vvi selec
			out << 0.0 # alt selec
			out << 0.0 # baro in hg
			out << 0.0 # DH ft
			out << 0.0 # Mcaut 0/1
			out << 0.0 # Mwarn 0/1
			out << 0.0 # GPWS 0/1
			out << 0.0 # Mmode 0–4
			out << 0.0 # Mrang 0–6
			out << 0.0 # throt ratio
			out << 0.0 # prop cntrl
			out << 0.0 # prop rpm
			out << 0.0 # prop deg
			out << 0.0 # N1 %
			out << 0.0 # N2 %
			out << 0.0 # MPR inch
			out << 0.0 # EPR ind
			out << 0.0 # torq ft*lb
			out << 0.0 # FF lb/hr
			out << 0.0 # ITT deg C
			out << 0.0 # EGT deg C
			out << 0.0 # CHT deg C
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << 0.0
			out << nil
		end
	end
end
