<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\RecipientListSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Recipient Lists';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="recipient-list-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Recipient List', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            //'recipient_list_id',
            'group_id',
            'recipient_name',
            'recipient_phone_number',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>

</div>
