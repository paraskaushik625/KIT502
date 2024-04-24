<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutorial 6</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <?php
    // include the database file 
    include('db_conn.php');
    ?>
</head>

<body>
    <div class="container">
        <h1>Submission List</h1>
    </div>

    <div class="container p-2">
        <a href="createsubmission.php" class="btn btn-sm btn-secondary">Submit a new paper</a>
        <table class="table">
            <tr>
                <td>PaperID</td>
                <td>Author</td>
                <td>Types</td>
                <td>Title</td>
                <td>Abstract</td>
                <td>Locations</td>
                <td>Scores</td>
                <td>Action</td>
            </tr>
            <?php
            // query for retrieving the rows
            $query = "SELECT papers.paperID AS PaperID, users.name AS Author, locations.description AS Types, papers.title AS Title, papers.abstract AS Abstract, locations.location AS Locations, avg(review.result) AS Scores
            FROM papers
            JOIN users ON papers.userID=users.userID
            JOIN review ON review.paperID = papers.paperID
            JOIN locations ON locations.paper_type = papers.paper_type
            GROUP BY users.userID ;
            ";


            // query() <-function to execute the query in the database
            $stmt = $db->query($query);

            //call a method "fetch"
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>

                <tr>
                    <td><?php echo $row['PaperID']; ?></td>
                    <td><?php echo $row['Author']; ?></td>
                    <td><?php echo $row['Types']; ?></td>
                    <td><?php echo $row['Title']; ?></td>
                    <td><?php echo $row['Abstract']; ?></td>
                    <td><?php echo $row['Locations']; ?></td>
                    <td><?php echo $row['Scores']; ?></td>
                    <td>
                        <a href="#" class="btn btn-sm btn-primary reviewer-btn" data-paper-id="<?php echo $row['PaperID']; ?>">Review</a>
                        <a href="edit.php?paper_id=<?php echo $row['PaperID']; ?>" class="btn btn-sm btn-warning">Edit</a>
                        <form method="post" action="delete.php" style="display: inline;">
                            <input type="hidden" name="paper_id" value="<?php echo $row['PaperID']; ?>">
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this item?')">Delete</button>
                        </form>
                    </td>
                </tr>

            <?php } ?>
    </div>

    <!-- Modal for displaying reviewer's information -->
    <div class="modal fade" id="reviewerInfoModal" tabindex="-1" aria-labelledby="reviewerInfoModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="reviewerInfoModalLabel">Review Information</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="reviewerInfo"></div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            // Function to fetch reviewer's information
            function getReviewerInfo(paperID) {
                $.ajax({
                    type: 'POST',
                    url: 'get_reviewer_info.php',
                    data: {
                        paper_id: paperID
                    },
                    success: function(response) {
                        // Display the reviewer's information in the modal
                        $('#reviewerInfo').html(response);
                        $('#reviewerInfoModal').modal('show');
                    },
                    error: function(xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });
            }

            // Event listener when a user clicks "Reviewer" button
            $(document).on('click', '.reviewer-btn', function() {
                var paperID = $(this).data('paper-id');
                getReviewerInfo(paperID);
            });
        });
    </script>
</body>

</html>
