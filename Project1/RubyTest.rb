class Tier
  def sagt
    puts "#{self.class} sagt nichts" # "text#{logik}text" ist Rubys Textinterpolation
  end
end

module KannSchwimmen # Module, d. h. KannSchwimmen.new geht nicht
  def schwimmt
    puts "#{self.class} schwimmt" # self gibt die Instanz zurück,
  end                             #  jedes Objekt hat eine Methode .class die das Klassenobjekt zurück gibt
end

module KannNichtSchwimmen
  def schwimmt
    puts "#{self.class} geht unter" 
  end
end

class Fisch < Tier # Vererbung wird durch den Kleiner-Als-Operator gekennzeichnet
  include KannSchwimmen # füge KannSchwimmen zwischen Fisch und Tier ein
end

class Vogel < Tier
  include KannNichtSchwimmen
  def sagt # übliches Vererben, überdecke sagt-Methode von Tier
    puts "#{self.class}: Piep"
  end
end

class Mensch < Tier
  include KannSchwimmen
  def sagt
    puts "#{self.class}: Ich kann mich besser ausdrücken"
  end
end

class NichtSchwimmer < Mensch
  prepend KannNichtSchwimmen # hänge KannNichtSchwimmen vor NichtSchwimmer ein,
end                          # dh, überdecke die schwimmt-Methode

fisch = Fisch.new
mensch = Mensch.new
vogel = Vogel.new
nicht_schwimmer = NichtSchwimmer.new

fisch.sagt                # => Fisch sagt nichts
vogel.sagt                # => Vogel: Piep
mensch.sagt               # => Mensch: Ich kann mich besser ausdrücken
nicht_schwimmer.sagt      # => NichtSchwimmer: Ich kann mich besser ausdrücken
puts
fisch.schwimmt            # => Fisch schwimmt
vogel.schwimmt            # => Vogel geht unter
mensch.schwimmt           # => Mensch schwimmt
nicht_schwimmer.schwimmt  # => NichtSchwimmer geht unter