<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Test;

/**
 * TestSearch represents the model behind the search form about `backend\models\Test`.
 */
class TestSearch extends Test
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['test_id', 'col1'], 'integer'],
            [['col2', 'col3'], 'safe'],
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
    public function search($params)
    {
        $query = Test::find();

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
            'test_id' => $this->test_id,
            'col1' => $this->col1,
            'col3' => $this->col3,
        ]);

        $query->andFilterWhere(['like', 'col2', $this->col2]);

        return $dataProvider;
    }
}
