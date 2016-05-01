<?php

/* @var $this yii\web\View */

$this->title = 'My Yii Application';
?>
<div class="site-index">

    <div class="jumbotron">
        <h1>SMS Messenger</h1>
        <p class="lead">Connects your mates via SMS</p>
        <p><a class="btn btn-lg btn-success" href="http://localhost:8888/sec/SMS-Messenger-Backend-Project/backend/web/#">Get started with Us</a></p>
    </div>


    <div class="body-content">

        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4">
                <h2>Users</h2>
                <p><a class="btn btn-default" href="http://localhost:8888/sec/SMS-Messenger-Backend-Project/backend/web/?r=user">Users</a></p>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4">
                <h2>Groups</h2>
                <p><a class="btn btn-default" href="http://localhost:8888/sec/SMS-Messenger-Backend-Project/backend/web/?r=user-group">Groups</a></p>
            </div>

            <div class="col-lg-4 col-md-4 col-sm-4">
                <h2>Recipient list</h2>
                <p><a class="btn btn-default" href="http://localhost:8888/sec/SMS-Messenger-Backend-Project/backend/web/?r=recipient-list">Recipient List</a></p>
            </div>

        </div>

        <p><a class="btn btn-sm btn-danger" href="http://localhost:8888/sec/SMS-Messenger-Backend-Project/backend/web/?r=gii">gii</a></p>

    </div>
</div>
