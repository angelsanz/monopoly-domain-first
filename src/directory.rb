class Directory

  LIST=[
    'Go','Mediterranean Avenue','South Community Chest',
    'Baltic Avenue','Income Tax','Readind Railroad',
    'Oriental Avenue','South Chance','Vermont Avenue',
    'Connecticut Avenue','Just Visiting','St Charles Place',
    'Electric Company','States Avenue','Virginia Avenue',
    'Pennsylvania Railroad','St James Place',
    'West Community Chest','Tenesse Avenue','New York Avenue',
    'Free Parking','Kentucky Avenue','North Chance',
    'Indiana Avenue','Illinois Avenue','B&O Railroad',
    'Atlantic Avenue','Ventnor Avenue','Water Works',
    'Marvin Gardens','Go To Jail','Pacific Avenue',
    'North Carolina Avenue','East Community Chest',
    'Pennsylvania Avenue','Short Line','East Chance',
    'Park Place','Luxury Tax','Boardwalk']

  def self.to_index(name)

    name.to_i
  end

  def self.to_name(index)
    return LIST[index] unless LIST[index].nil?
    index.to_s
  end
end