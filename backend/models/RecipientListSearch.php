<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\RecipientList;

/**
 * RecipientListSearch represents the model behind the search form about `backend\models\RecipientList`.
 */
class RecipientListSearch extends RecipientList
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['recipient_list_id', 'group_id'], 'integer'],
            [['recipient_name', 'recipient_phone_number'], 'safe'],
            [['param'], 'string', 'on' => 'RECIPIENTS'],
        ];
    }


    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */

    //public $g_id;
    public function search($params)
    {
        
        $group_id = $params['params'];
        $query = RecipientList::find()->where(['group_id' => $group_id]);
        

        //$query = RecipientList::find();

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        $query->andFilterWhere([
            'recipient_list_id' => $this->recipient_list_id,
            'group_id' => $this->group_id,
        ]);

        $query->andFilterWhere(['like', 'recipient_name', $this->recipient_name])
            ->andFilterWhere(['like', 'recipient_phone_number', $this->recipient_phone_number]);

        return $dataProvider;
    }
}
