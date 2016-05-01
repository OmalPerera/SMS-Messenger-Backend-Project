<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
use Yii;
use yii\helpers\Url;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\UserGroupSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'User Groups';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-group-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::button('Create User Group', ['value'=>Url::to('index.php?r=user-group/create'),'class' => 'btn btn-success', 'id'=>'create_groups_button']) ?>
    </p>


    <!-- Uses for popup form -->

        <?php
            Modal::begin([
                //'header'=>'<h4>Groups</h4>',
                'id'=>'create_groups_modal',
                'size'=>'modal-md',
            ]);
            echo "<div id='create_groups_modalContent'></div>";
            Modal::end();

        ?>
    <!-- +++++++++++++++++++ -->

    <?php Pjax::begin(); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        //navigate to the relevent recipient list by click on the group name
        'rowOptions' => function ($model, $key, $index, $grid) {
                    return [
                        'style' => "cursor: pointer",
                        'id' => $model['group_id'],
                        'onclick' => 'location.href="'.Yii::$app->urlManager->createUrl('recipient-list/recipients').'&scenario=RECIPIENTS&params="+(this.id);',
                        //'id' => $model['group_id'],
                    ];  
                },

        'columns' => [
            //['class' => 'yii\grid\SerialColumn'],

            'group_id',
            //'group_owner_id',
            'group_name',
            //'group_registration_date',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
