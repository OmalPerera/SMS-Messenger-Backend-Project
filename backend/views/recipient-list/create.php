<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\RecipientList */

$this->title = 'Create Recipient List';
$this->params['breadcrumbs'][] = ['label' => 'Recipient Lists', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="recipient-list-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
