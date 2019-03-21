<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
    </head>
    <body>
        <?php
       
        include 'classFiles/Book.php';              // included all files in index file. No need to include database.php file here 
                                                      //as it is already included in the child class files'. 
        include 'classFiles/User.php';
        include 'classFiles/Contact.php';
        include 'classFiles/Genre.php';
        include 'classFiles/Author.php';
        include 'classFiles/BookAuthor.php';
       
        $DB1= new Database();                 //created DBTable object
        $book1= new Book();                   // instantiated book class 
        echo $book1->countData();             // calling parent method on child object
        echo "<br>";
        $book1->setBookId(2);
        $book1->setBookTitle('Harry Potter');       // to set book title 'Harry Potter' by calling method setBookTitle.
        echo $book1->getAllValues();                // called method getAllValues from parent class over object of book class
        echo "<br>";
                 
        
        $user1= new User(1, 'Aleshia','Jain',1);    // created object of class User and passed values through constructor.
        echo $user1->getAllValues();                // called methos getAllValues from parent cass over object of user class (child class)
        echo "<br>";
        
        $obj1= new Contact();                           // created object of class Contact
        
        echo "enter user's phone number : "; 
        $phNumber= stream_get_line(STDIN, 100, "\n");   // wanted to check how to pass a value to the variable in a method through command line. 
        
        $obj1->setPhNumber($phNumber);  
        echo "<br>";
        $obj1->getphNumber();
        
        $obj1->setCityName('London');           //to set the city, passed the value 'London' to the variable city in contact class. 
        $obj1->setContactId(2);
        $obj1->setEmailId('ash.man@gmai.com');
        $obj1->setaddress('5 Binney Street', 'Abby Ward');
        echo "<br>";
        echo $obj1->getAllValues();             // called method getAllValues() of Contct class... because its called on object of contact class... which is $obj1. 
        echo "<br>";
        
        //$obj2= new Contact(" ","","","","", "RG6 4HY");
         
        //echo $obj2->getAllValues();
        //$DB1->getAllValues();
        
        //    $authorobj = new author(1,"Jane", "Austin");
        //    $authorobj -> getAllValues(); 
        
        
        $book = new Book(1, "title");
        $author = new Author(2, "Mandar", "Vaidya");

        $bookAuthor = new BookAuthor($book->getBookId(), $author->getAuthorId());
        echo $bookAuthor->getAllValues();
           
        ?>
    </body>
</html>
