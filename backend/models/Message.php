<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "message".
 *
 * @property integer $message_id
 * @property string $message_subject
 * @property string $message_body
 * @property string $message_create_date
 * @property integer $message_author_id
 *
 * @property User $messageAuthor
 * @property MessageDelivery[] $messageDeliveries
 * @property MessageHistory[] $messageHistories
 */
class Message extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'message';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['message_id', 'message_subject', 'message_body', 'message_create_date', 'message_author_id'], 'required'],
            [['message_id', 'message_author_id'], 'integer'],
            [['message_create_date'], 'safe'],
            [['message_subject'], 'string', 'max' => 300],
            [['message_body'], 'string', 'max' => 500],
            [['message_id'], 'unique']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'message_id' => 'Message ID',
            'message_subject' => 'Message Subject',
            'message_body' => 'Message Body',
            'message_create_date' => 'Message Create Date',
            'message_author_id' => 'Message Author ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMessageAuthor()
    {
        return $this->hasOne(User::className(), ['id' => 'message_author_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMessageDeliveries()
    {
        return $this->hasMany(MessageDelivery::className(), ['message_id' => 'message_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMessageHistories()
    {
        return $this->hasMany(MessageHistory::className(), ['message_id' => 'message_id']);
    }
}
