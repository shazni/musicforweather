import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /MusicMood on httpDefaultListener {
    resource function get playlist(string location) returns MusicSuggestion|error {
        json weatherResponse = check weatherAPIClient->get(string `/current.json?q=${location}&key=${WEATHER_API_KEY}`);
        json current = check weatherResponse.current;
        json condition = check current.condition;
        int weatherCode = check condition.code.ensureType();
        string musicMood = getMusicModeForWeather(weatherCode);
        json spotifyResponse = check spotifyClient->get(string `/search?q=${musicMood}&type=playlist`);

        return transform(weatherResponse, spotifyResponse);
    }
}