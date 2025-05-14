import ballerina/lang.value;

function transform(json weatherData, json spotifyData) returns MusicSuggestion|error {
    WeatherData weatherInfo = check value:fromJsonWithType(weatherData);
    SpotifyPlayList spotifyInfo = check value:fromJsonWithType(spotifyData);

    PlayListInfo[] playListInfo = [];
    foreach ItemsItem? item in spotifyInfo.playlists.items {
        if item is ItemsItem {
            playListInfo.push({
                name: item.name,
                url: item.external_urls.spotify,
                artist: item.owner.display_name
            });
        }
    }

    return {
        location: weatherInfo.location.name,
        weather: weatherInfo.current.condition.text,
        musicMode: getMusicModeForWeather(weatherInfo.current.condition.code),
        playList: playListInfo
    };
}