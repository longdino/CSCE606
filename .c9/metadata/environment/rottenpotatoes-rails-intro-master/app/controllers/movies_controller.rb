{"filter":false,"title":"movies_controller.rb","tooltip":"/rottenpotatoes-rails-intro-master/app/controllers/movies_controller.rb","undoManager":{"mark":1,"position":1,"stack":[[{"start":{"row":30,"column":0},"end":{"row":30,"column":30},"action":"remove","lines":["      session[:filtered] = nil"],"id":2},{"start":{"row":29,"column":54},"end":{"row":30,"column":0},"action":"remove","lines":["",""]}],[{"start":{"row":9,"column":4},"end":{"row":49,"column":7},"action":"remove","lines":["@movies = Movie.all","    @all_ratings = Movie.all_ratings","    ","    # Part 3: remember the sorting and filtering settings","    ","    ","    # Part 1: filter the list of movies by rating","    ","    if params[:ratings] ","      @ratings_to_show = params[:ratings].keys","      session[:filtered] = @ratings_to_show","    elsif session[:filtered]","      query = Hash(new)","      session[:filtered].each do |rating|","        query['ratings[' + rating + ']'] = 1","      end","      if params[:sort]","        query['sort'] = params[:sort]","      end","      # @filtered_hash = Hash[@ratings_to_show.collect {|key| [key]}]","      # @sorted = (params[:order]) ? params[:order]:\"\"","      flash.keep","      redirect_to movie_path(query)","    else","      @ratings_to_show = @all_ratings","    end","    ","    @ratings_to_show_hash = Hash[@ratings_to_show.collect {|key| [key]}]","    @movies = Movie.with_ratings(params[:ratings])","    ","    # Part 2: sort the list of movies by title or release date","    if params[:order] == 'title'","      @movies = @movies.order(params[:order])","      @title_header = \"hilite bg-warning\"","    elsif params[:order] == 'release_date'","      @movies = @movies.order(params[:order])","      @release_date_header =\"hilite bg-warning\"","    else","      #@movies = Movie.all #for part 2","      @movies = Movie.with_ratings(params[:ratings]) # for part 1","    end"],"id":3},{"start":{"row":9,"column":4},"end":{"row":30,"column":7},"action":"insert","lines":["@movies = Movie.with_ratings(params[:ratings])","    @all_ratings = Movie.all_ratings","    ","    # Part 1: filter the list of movies by rating","    if params[:ratings] ","      @ratings_to_show = params[:ratings].keys","    else","      @ratings_to_show = @all_ratings","    end","    @ratings_to_show_hash = Hash[@ratings_to_show.collect {|key| [key]}]","","    # Part 2: sort the list of movies by title or release date","    if params[:order] == 'title'","      @movies = @movies.order(params[:order])","      @title_header = \"hilite\"","    elsif params[:order] == 'release_date'","      @movies = @movies.order(params[:order])","      @release_date_header =\"hilite\"","    else","      #@movies = Movie.all #for part 2","      @movies = Movie.with_ratings(params[:ratings]) # for part 1","    end"]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":30,"column":7},"end":{"row":30,"column":7},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1614243859897,"hash":"3c22b74cfdc37ac2fb4f084236520f15f01cddd8"}