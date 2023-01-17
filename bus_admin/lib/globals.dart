

var BusSrNo;
var BusVehicleNo;
var station;
var link;
var station_list=List.empty(growable: true);
var station_map=Map();
var id_list=List.empty(growable: true);
var straight=1;
var time;
var time_list=List.empty(growable: true);
void parseurl(url, para)
{
  station_map[para]=url.split("/")[6].replaceAll("@", "").split(",");
}