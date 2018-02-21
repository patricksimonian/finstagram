

def living_standards_by_area 
    {
        "mainland": [{
            min_amount: 1000000,
            oppinion: "your pretty rich"
        },
        {
            min_amount: 100000,
            oppinion: "your alright"
        },
        {
            min_amount: 50000,
            oppinion: "your okay"
        },
        {
            min_amount: 0,
            oppinion: "peon"
        }],
        "island": [{
            min_amount: 500000,
            oppinion: "your pretty rich"
        },
        {
            min_amount: 100000,
            oppinion: "your alright"
        },
        {
            min_amount: 50000,
            oppinion: "your pretty good"
        },
        {
            min_amount: 0,
            oppinion: "its a struggle"
        }]
    }
end

def how_rich_am_i?(total_monies, area_in_bc)
    #get the living standards for the area
    standards_in_area = living_standards_by_area[area_in_bc.to_sym]
    # set a variable for the oppinion on your living situation
    oppinion_of_you = "didn't find area"
    # loop over the area standards and find a match
    standards_in_area.each do |standard|
        # if your money is greater than the min amount for that standard
       if total_monies > standard[:min_amount]
        #   set the oppinion of you to be that standards oppinoin
           oppinion_of_you = standard[:oppinion]
        #   break out of loop
           break
       end
    end
    # return
    oppinion_of_you
end



money = 10000
area = "mainland"

puts how_rich_am_i?(money, area)