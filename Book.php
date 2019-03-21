<?php

include_once 'Database.php'; 

class Book extends Database
{
    private $book_id;
    private $title;

    public function __construct($book_id='', $title='') 
    {
        $this->book_id = $book_id;

        $this->title = $title;
    }
    
    public function getBookId()
    {
        return $this->book_id;
    }
    
    public function getBookTitle()
    {
        return $this->title;
    }
    public function setBookId($bookId)
    {
        $this->book_id=$bookId;
    
    }
    public function setBookTitle($bookTitle)
    {
        $this->book_title=$bookTitle;
    
    }
    
    public function getAllValues() 
    {
        $allValues = "\n\n Book Details\n".
                     "Book id : ".$this->book_id. "\n".
                     " Book Title : ".$this->book_title."\n";
        return $allValues;
    }
      
}
    



