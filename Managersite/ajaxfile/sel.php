<?php
// echo "helo";
$conn = mysqli_connect("localhost","root","","workprogresstracker");


$val=$_POST['data'];

$sql_task = "select task_id,task_title,emp_email,status,start_date,end_date,task_description from tasks LEFT OUTER JOIN employee on tasks.e_id =employee.eid ";

$result_task = mysqli_query($conn,$sql_task);

$idnum = 1;
echo "<tr>
<th>#</th>
<th>Task Title</th>
<th>status</th>
<th>start date</th>
<th>end date</th>
<th>Description</th>
<th>E-name</th>
<th>Edit</th>
<th>Delete</th>
</tr>";

if($result_task -> num_rows > 0)
{
for($a=0;$a<$val;$a++){
    $rows = $result_task->fetch_assoc();
    if($rows['task_id']==''){
    }
    else{
    ?>
    <tr>
    <td><?php echo $idnum ?> </td>
    <td><?php echo  $rows['task_title']?></td>
    <td><?php echo  $rows['status']?></td>
    <td><?php echo  $rows['start_date']?> </td>
    <td><?php echo  $rows['end_date'] ?></td>
    <td><a href="./../description_tasks/<?php echo $rows['task_description']?>" download >Download</a></td>
    <td><?php echo $rows['emp_email']?></td>
    <td><a href ="task_action/tasskedit.php?task_id= <?php echo $rows["task_id"] ?>">Edit</a></td>
    <td><a href ="task_action/tasskdelete.php?task_id= <?php echo $rows["task_id"] ?>">Delete</a></td>
    </tr>
    <?php 
    $idnum++;

}
}
}
else
{
    echo "no data";
}

?><?php  $conn->close();  ?>