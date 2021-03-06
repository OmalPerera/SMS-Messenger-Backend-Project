<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\MessageHistory */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="message-history-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'history_log_id')->textInput() ?>

    <?= $form->field($model, 'message_id')->textInput() ?>

    <?= $form->field($model, 'message_sent_group_id')->textInput() ?>

    <?= $form->field($model, 'message_sent_list')->textInput() ?>

    <?= $form->field($model, 'delivery_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
