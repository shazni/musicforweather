public function getMusicModeForWeather(int weatherCode) returns string {
    match weatherCode {
        1000 => {
            return "Happy Pop";
        }
        1003 => {
            return "Light Jazz";
        }
        1006|1009 => {
            return "Ambient Chill";
        }
        1030|1135|1147 => {
            return "Atmospheric Electronic";
        }
        1063|1150|1153|1180|1183 => {
            return "Soft Acoustic";
        }
        1186|1189|1192|1195|1240|1243 => {
            return "Melancholic Piano";
        }
        1066|1210|1213|1216|1219|1255 => {
            return "Winter Classical";
        }
        1114|1117|1222|1225 => {
            return "Nordic Metal";
        }
        1087|1273|1276 => {
            return "Epic Orchestra";
        }
        1246 => {
            return "Dark Electronic";
        }
        _ => {
            return "Lofi Beats";
        }
    }
}