<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class UserAuthRegController extends Controller
{
    //
    public function signup_post(Request $request){
        //return "success";
        $user_name = $request->user_name;
        $password = $request->password;
        $email = $request->email;
        $mobile_number = $request->mobile_number;
        $present_address = $request->present_address;
        $supervisor_id = $request->supervisor_id;
        $group_row_id = $request->group_row_id;
        $emergency_number = $request->emergency_number;
        //dd($group_row_id);
        $insert_link_chage_history = DB::table('scl_tracker_db.user_table')->insertGetId(
            [ 
                'user_name'=>$user_name,
                'email'=>$email,
                'password'=>$password,
                'phone'=>$mobile_number,
                'present_address'=>$present_address,
                'supervisor_id'=>$supervisor_id,
            ]
            );
        foreach($group_row_id as $group_id){
            $insert_group_id = DB::table('scl_tracker_db.user_group')->insertGetId(
                [ 
                    'user_row_id'=>$insert_link_chage_history,
                    'group_row_id'=>$group_id
                ]
                );
        }    
        foreach($emergency_number as $number){
            $insert_emergency_contact = DB::table('scl_tracker_db.emergency_number_table')->insertGetId(
                [ 
                    'user_row_id'=>$insert_link_chage_history,
                    'mobile_number'=>$number

                ]
                );
        }
        
        return $insert_link_chage_history;   
     }
     public function select_supervisor(Request $request){
        $query = "SELECT * FROM scl_tracker_db.user_table";
        $data = \DB::select(\DB::raw($query));

        $json_array = array();

        foreach($data as $row){
            $obj = array();
            $obj["id"] = $row->row_id;
            $obj["user_name"] = $row->user_name;
            $obj["email"] = $row->email;
            $obj["password"] = $row->password;
            $obj["phone"] = $row->phone;
            $obj["present_address"] = $row->present_address;
            $obj["supervisor_id"] = $row->supervisor_id;

            array_push($json_array,$obj);
        }
        
        $json = json_encode($json_array);

        return $json;
    }
    public function select_group(Request $request){
        $query = "SELECT * FROM scl_tracker_db.group_name_table";
        $data = \DB::select(\DB::raw($query));

        $json_array = array();

        foreach($data as $row){
            $obj = array();
            $obj["row_id"] = $row->row_id;
            $obj["group_name"] = $row->group_name;
        
            array_push($json_array,$obj);
        }
        
        $json = json_encode($json_array);

        return $json;
    }
}
