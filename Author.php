<?php

include_once 'Database.php';      //included parent class file

class Author extends Database     // DBTable is a parent class and Author is a child class
{
    private $author_id;
    private $first_name;
    private $last_name;
    
    public function __construct($author_id,$first_name,$last_name)   //constructor defination
    {
        $this->author_id = $author_id;
        $this->first_name = $first_name;
        $this->last_name = $last_name;
    }
    
    public function getFirstName()      // getter function for getting values of attributes $first_name and $last_name.
    {
        return $this->first_name;
    }
    
    public function getLastName()
    {
        return $this->last_name;
    }
    
    public function getAuthorId()
    {
        return $this->author_id;
    }
    
    public function getAllValues() 
    {
        $allValues = "Author Details\n".
                     "book_id : ".$this->book_id. "\n".
                     " Author name : ".$this->first_name." ".$this->last_name."\n";
        return $allValues;
    }
}


