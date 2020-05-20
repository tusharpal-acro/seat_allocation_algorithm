module SeatAllocatorConcern

  def find_seats(no_of_seats = 1, id)
    no_of_seats = no_of_seats.to_i
    @movie = Movie.find_by(id: id)
    if (@movie.movie_name == '') 
        return ('Error: Please provide movie title');
        return 1; 
    end
    @data = JSON.parse(MovieSerializer.new(@movie).to_json);
    @rows = @movie.venue.rows;
    @cols = @movie.venue.columns;
    if (no_of_seats > @cols)
        return ('Error: Number of seats requested exceeds number of seats available in a row');
        return 1;
    end
    best_available_seat = find_best_available_seat(no_of_seats);
    if !(best_available_seat) 
        return ('Error: Could not find seat. This may be because no appropriate seats are available');
        return 1;
    end
    a = best_available_seat.join(",");
    return a;
  end

  def find_best_seat(no_of_seats,available_seats)
    best_seat = []
    left = no_of_seats/2
    right = no_of_seats/2-1
    right = no_of_seats/2 if no_of_seats%2 == 1
    @index = @cols/2-1
    left.times do |i|
      best_seat.push(available_seats[@index-(i+1)]) if available_seats[@index - (i+1)].present?
    end
    best_seat.push(available_seats[@index]) if available_seats[@index].present?
    right.times do |i|
      best_seat.push(available_seats[@index+(i+1)]) if available_seats[@index + (i+1)].present?
    end
    return best_seat.map{|a| a[1]}
  end

  def find_best_available_seat(no_of_seats)
    available_seats = []    
    @data['seats'].map{|a|available_seats.push([a[1]["row"],a[0]]) if a[1]['status']=="AVAILABLE" }
    available_seats = find_available_seats_in_a_row(available_seats.sort,no_of_seats)
    return find_best_seat(no_of_seats,available_seats) if available_seats.present?
    return ('Error: No Seats available');
    return 1;
  end

  def find_available_seats_in_a_row(available_seats,no_of_seats)
    availables = {}
    available_seats.each do |av|
      if availables.has_key? av[0] 
        availables[av[0]] = availables[av[0]]+1 
      else
        availables[av[0]]= 1
      end
      return available_seats = available_seats -  available_seats.map{|a|a if a[0]!=av[0] } if availables[av[0]] > no_of_seats
    end
  end

end