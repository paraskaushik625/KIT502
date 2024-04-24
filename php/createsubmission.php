<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit a new paper</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <h1>Submit a new paper</h1>
    </div>

    <div class="container p-2">
        <form method="post" action="check_author.php">
            <div class="mb-3">
                <label for="Author" class="form-label">Author</label>
                <input type="text" class="form-control" id="Author" name="Author">
            </div>
            <div class="mb-3">
                <label for="EmailAddress" class="form-label">Email Address</label>
                <input type="email" class="form-control" id="EmailAddress" name="EmailAddress">
            </div>
            <div class="mb-3">
                <label for="Affiliate" class="form-label">Affiliate</label>
                <input type="text" class="form-control" id="Affiliate" name="Affiliate">
            </div>
            <button type="submit" class="btn btn-primary" name="Next">Next</button>
            <a href="submission_list.php" class="btn btn-secondary">Cancel</a>
        </form>
    </div>

</body>

</html>
