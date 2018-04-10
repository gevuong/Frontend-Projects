class Api::FetchesController < ApplicationController

    def index
        # in index, run fetch() defined in model. This will return a response with all data. THEN, upon returning results, you can extrapolate response data based on client-side search query.

        # For example,
        # 1. a list of friends names are pulled from api response, render that list using componentDidMount() and async thunk action, requestFetchThings().
        # 2. when user inputs first character in <input onChange={this.handleSearch}>, handleSearch(event) will be invoked, which contains this.props.requestSearchThings(event.target.value) will be invoked, an AJAX request will be sent to backend, hitting the #index controller action.
        # 3. search(query) will filter all names containing those letters, and then sort the names.
        # 4. Then assign remaining names to ivar, which gets passed to jbuilder. The data is then passed to receiveSearchedThings(data), and data becomes a value key value attribute.
        # 5. receiveSearchedThings(data) gets dispatched to reducer, and the state gets updated with new data.



        @fetched_data = Api::Fetch.fetch
        @nps = Api::Fetch.new("58")

        if @nps.campgrounds
            # render json: @fetched_data
            render json: @nps.campgrounds
            # render :index
        else
            render json: @fetched_data.errors.full_messages, status: 422
        end


    end
end
