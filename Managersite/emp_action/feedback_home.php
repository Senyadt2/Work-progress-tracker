<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #container{
            width:100%;
            height:100vh;
            display:flex;
            justify-content: center;
            align-items: center;
            
        }
        #form_data{
        
            width:auto;
            height:400px;
            background-color:gray;
            padding:20px;
        }
        .flex_row{
            display: flex;
             justify-content: space-around;
        }
        input[type="text"] {
           width: auto;
            height: 30px;
            margin: 10px;
}
select#status {
    margin-top: 20px;
}
button[type="submit"]
{
    margin-top:30px;
}
    </style>
</head>
<body>
    <?php
        session_start();
        $conn = mysqli_connect("localhost","root","","workprogresstracker");
        if($conn->connect_error)
         {
          die($conn->connect_error);
         }
                // $sessionid =$_SESSION['id'];
                // echo $task_id;
                // $sql = "SELECT * from tasks";
                // $result = mysqli_query($conn,$sql);
               $task_id= $_GET['task_id'];
               $task_title=$_GET['task_title'];
                $emp_name=$_GET['emp_name'];
               $status= $_GET['status'];
               $start_date= $_GET['start_date'];
              $end_date=  $_GET['end_date'];
              $feedback = $_GET['feedback'];
            //   echo $task_title;
              




            ?>
    <div id="container">
        <div id="form_data">
        <form action="feedback_send.php" method="post">
        <div class="flex_row">
                    <input type="hidden" name="task_id" value="<?php echo $task_id?>">
                  <label for="Task_title">Task_title</label>
                  <label for="Assigend Employee ">Assigend Employee </label>
                </div>
                <div class="flex_row">
                    <input type="text" name="task_title"  value="<?php echo $task_title?>" disabled>
                    <input type="text" name="Assigend Employee"  value="<?php echo $emp_name?>" disabled>
                 </div>
                 <div class="flex_row">
                 <label for="Start_date">Start_date</label>
                 <label for="End_date">End_date</label>
                 </div>
                 <div class="flex_row">
                <input type="text" name="start_date"  value="<?php  echo $start_date ?>" disabled>
                <input type="text" name="end_date"  value="<?php  echo $end_date ?>" disabled>
            </div>
            <div>
                    <textarea name="feedback" id="feedback" style ="width: 371px;height: 186px;" ><?php echo $feedback;?></textarea>
                    <br>
                    <select name="status" id="status">
                        <option value="Completed">Completed</option>
                        <option value="Pending">Re-Assign</option>
                    </select>

            <button type="submit">submit</button>
        </form>
        </div>
    </div>
</body>
<script>
    // Select the form element
var form = document.querySelector("form");

// Function to enable all disabled elements
function enableDisabledElements() {
  // Select all elements with the disabled attribute within the form
  var disabledElements = form.querySelectorAll("[disabled]");

  // Iterate over the disabled elements and remove the disabled attribute
  disabledElements.forEach(function(element) {
    element.removeAttribute("disabled");
  });
}

// Add an event listener to the form submission
form.addEventListener("submit", function(event) {
  enableDisabledElements();
});

</script>
<?php  $conn->close();  ?>
</html>