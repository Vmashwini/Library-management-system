<?php

include_once 'Database.php'; 

class Contact extends Database
{
   
    private $contact_id;
    private $first_line;
    private $second_line;
    private $email_address;
    private $city;
    private $postcode;
    private $phone_number;
    

    public function __construct($contact_id="",$first_line="", $second_line="", $email_address="", $city="", $postcode="", $phone_number="") 
    {
        $this->user_id = $contact_id;
        $this->first_line = $first_line;       
        $this->second_line = $second_line;
        $this->email_address = $email_address;
        $this->city = $city;
        $this->postcode = $postcode;
        $this->phone_number = $phone_number;
        
    }
 
    public function getContactId()
    {
        return $this->contact_id;
    }
    
    public function getaddress()
    {
        return $this->first_line." ".$this->second_line;
    }
    
    public function getEmailId()
    {
        return $this->email_address;
    }
    
    public function getCity()
    {
        return $this->city;
    }
    public function getphNumber()
    {
        return $this->phone_number;
    }
    public function setPhNumber($number)
    {
        return $this->phone_number=$number;
    }
    
      public function setCityName($city)
    {
       return $this->city=$city;
    }
     
    public function setContactId($contactId)
    {
        return $this->contact_id = $contactId;
    }
     public function setaddress($firstLine, $secondLine)
    {
        $this->first_line= $firstLine;
        $this->second_line = $secondLine;
    }
    
    public function setEmailId($email)
    {
        $this->email_address = $email;
    }

     public function getAllValues()
    {
        $allColumns = "contact_id = ". $this->contact_id."\n". 
                      "first_line = ". $this->first_line."\n". 
                      "second_line = ".$this->second_line."\n". 
                      "email_address = ".$this->email_address."\n". 
                      "city = ".$this->city."\n". 
                      "postcode = ".$this->postcode."\n". 
                      "phone_number = ".$this->phone_number."\n";
                        
        return $allColumns; 
                
    }
    
}
