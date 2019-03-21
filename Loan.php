<?php

include_once 'Database.php'; 

class Loan extends Database
{
    private $user_id;
    private $book_id;
    private $loan_id;


    public function __construct($user_id,$book_id,$loan_id) 
    {
        $this->user_id = $user_id;
        $this->book_id = $book_id;
        $this->loan_id = $loan_id;
       
    }
    
    public function getUserId()
    {
        return $this->user_id;
    }
    
    public function getBookId()
    {
        return $this->book_id;
    }
    
    public function getLoanId()
    {
        return $this->loan_id;
    }
    
    public function getAllValues() 
    {
        $allValues = 
                     "\n"."User id : ".$this->user_id. "\n".
                     " Book id : ".$this->book_id."\n";
        return $allValues;
    }

}
