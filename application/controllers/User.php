<?php

defined ('BASEPATH') OR exit('No direct script access allowed');
class User extends CI_Controller {



public function __construct(){

        parent::__construct();

        $this->load->helper('url');
        $this->load->model('User_model');
        $this->load->database();


}

public function load_login()
{
$this->load->helper('url');
$this->load->helper('form');
$this->load->library('form_validation');
$this->load->view('login.php');

}

public function get_patients_diagnostics(){

    if ($this->input->post('submit')) {

       $data = array(
       'symptoms'=>$this->input->post('symptoms'),
       'medicines'=>$this->input->post('medicines'));


$this->User_model->saveDiagnostics($data['symptoms'],$data['medicines']);


}



}




public function getData(){

  if($this->input->post('login')){

      $data = array(
       'Email'=>$this->input->post('email'),
       'Password'=>md5($this->input->post('password')));






 if($this->User_model->log_user($data['Email'] ,$data['Password'] )==0){

  $this->session->set_userdata(array('email'=>$data['Email']));


    redirect("User/doctor_dashboard");


 }else{
  redirect("User/index");

 }




}

}

public function patient_info(){
  $this->load->view('patientInfo.php');

}

public function doctor_dashboard(){


  $this->load->view('doclanding.php');
}


public function load_register()
{
$this->load->helper('url');

$this->load->view('register');

if($this->input->post('register')){

  $data=array
           (
             'Firstname'=>$this->input->post('fname'),
             'Surname'=>$this->input->post('sname'),
             'Email'=>$this->input->post('email'),
             'Password'=>md5($this->input->post('password')),
             'ConfirmPass'=>md5($this->input->post('confirm_password'))

           );




           if($data['Password']==$data['ConfirmPass']){
             $this->User_model->saverecords($data['Firstname'],$data['Surname'],$data['Email'],$data['Password']);
             echo "Records Saved Successfully";
             redirect('User/load_login');
           }else{

             echo "Password do not match";
           }








}






}
function index()
{
  $data['allpat']=$this->User_model->getpat();
  $this->load->view('pat_view',$data);
}
function get_pat_result()
{
  $patData =$this->input->post('patData');
  if(isset($patData)and !empty($patData))
  {
    $records = $this->User_model->get_pat($patData);
    $output='';
    foreach ($records->result_array() as $row) {

      $output ='
      <h4 class="text-center"->'.$row["ID"].'</h4>
      <div class="row">
      <div class="col-lg-6">
      <table class = "table table-bordered">
      <tr>
            <td><b>sname</b></td>
            <td>'.$row["patientEmail"].'</td>
           </tr>
           <tr>
            <td><b>fname</b></td>
            <td>'.$row["Symptoms"].'</td>
           </tr>
           </table>
           </div>
           </div>';


    }
    echo $output;
  }

}




}

?>
