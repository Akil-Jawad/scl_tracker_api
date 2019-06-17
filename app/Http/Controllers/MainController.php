<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class MainController extends Controller
{
    //

    public function user_list(Request $request){
        $query = "SELECT * FROM scl_tracker_db.user_table";
        $data = \DB::select(\DB::raw($query));

        $json_array = array();

        foreach($data as $row){
            $obj = array();
            $obj["id"] = $row->id;
            $obj["phone"] = $row->phone;
            $obj["user_id"] = $row->user_id;
            $obj["lat"] = $row->lat;
            $obj["lon"] = $row->lon;
            $obj["geolocation"] = $row->geolocation;
            $obj["created_at"] = $row->created_at;

            array_push($json_array,$obj);
        }
        
        $json = json_encode($json_array);

        return $json;
    }

    public function insert_user(Request $request){

        //return "true";
        $phone = $request->phone;
        $user_id = $request->user_id;
        $lat = $request->lat;
        $lon = $request->lon;
        $geolocation = $request->geolocation;

        $insert_link_chage_history = DB::table('scl_tracker_db.user_table')->insertGetId(
            [ 
                'phone'=>$phone,
                'user_id'=>$user_id,
                'lat'=>$lat,
                'lon'=>$lon,
                'geolocation'=>$geolocation
            ]
            );

        return $insert_link_chage_history;
    }

    public function update_location(Request $request){
        $phone = $request->phone;
        $lat = $request->lat;
        $lon = $request->lon;
        $geolocation = $request->geolocation;

        // $query = "SELECT * FROM scl_tracker_db.user_table WHERE phone = '$phone' LIMIT 1";
        // $data = \DB::select(\DB::raw($query));

        // $insert_link_chage_history = DB::table('scl_tracker_db.user_table')->insertGetId(
        //     [ 
        //         'phone'=>$phone,
        //         'user_id'=>"",
        //         'lat'=>$lat,
        //         'lon'=>$lon            ]
        //     );


        $query = "UPDATE scl_tracker_db.user_table SET lat = '$lat', lon = '$lon', geolocation = '$geolocation' WHERE phone = '$phone'";
        $data = \DB::update(\DB::raw($query));

        return $data;
    }

    public function get_location(Request $request){
        $phone = $request->phone;

        $query = "SELECT * FROM scl_tracker_db.user_table WHERE phone = '$phone' ORDER BY id DESC LIMIT 1";
        $data = \DB::select(\DB::raw($query));

        $json_objects = array();
        $json_array = array();
        if(count($data)>0){
            $json_array["id"] = $data[0]->id;
            $json_array["phone"] = $data[0]->phone;
            $json_array["lat"] = $data[0]->lat;
            $json_array["lon"] = $data[0]->lon;
            $json_array["geolocation"] = $data[0]->geolocation;
            $json_array["created_at"] = $data[0]->created_at;
            $json_array["status"] = "200";

            array_push($json_objects,$json_array);
        }
        else{
            $json_array["status"] = "404";
            array_push($json_objects,$json_array);
        }
        return $json_objects;
    }
}
