<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "test".
 *
 * @property integer $test_id
 * @property integer $col1
 * @property string $col2
 * @property string $col3
 */
class Test extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'test';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['col1'], 'integer'],
            [['col3'], 'safe'],
            [['col2'], 'string', 'max' => 500]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'test_id' => 'Test ID',
            'col1' => 'Col1',
            'col2' => 'Col2',
            'col3' => 'Col3',
        ];
    }
}
