<?php

include_once 'Database.php'; 

class User extends Database
{
    private $user_id;
    private $first_name;
    private $last_name;
    private $contact_id;

    public function __construct($user_id, $first_name, $last_name, $contact_id) 
    {
        $this->user_id = $user_id;
        $this->first_name = $first_name;       
        $this->last_name = $last_name;
    }

    public function getUserId()
    {
        return $this->user_id;
    }
    
    public function getName()
    {
        return $this->first_name." ".$this->last_name;
    }
    
    public function getContactId()
    {
        return $this->contact_id;
    }
    
    public function setUserId($userId)
    {
         $this->user_id=$userId;
    }
    public function setFisrtName($firstName)
    {
         $this->first_name=$firstName;
    }
    public function setLastName($lastName)
    {
         $this->last_name=$lastName;
    }
     
    public function getAllValues()
    {
        $allColumns = "\n User Details \n ".
                       "User id : ". $this->user_id."\n". 
                      "First name : ".$this->first_name."\n". 
                      "Last name : ".$this->last_name."\n".
                      "Contact id : ".$this->contact_id ; 

        return $allColumns; 
    }
}




