class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'フランス料理' },
    { id: 3, name: 'イタリア料理' },
    { id: 4, name: 'スペイン料理' },
    { id: 5, name: '中華料理' },
    { id: 6, name: '韓国料理' },
    { id: 7, name: 'タイ料理' },
    { id: 8, name: 'ベトナム料理' },
    { id: 9, name: 'インド料理' },
    { id: 10, name: '鮨' },
    { id: 11, name: '魚介・海鮮料理' },
    { id: 12, name: '鉄板焼' },
    { id: 13, name: '天ぷら' },
    { id: 14, name: '焼鳥' },
    { id: 15, name: '鍋' },
    { id: 16, name: 'すき焼き・しゃぶしゃぶ'},
    { id: 17, name: 'うなぎ料理' },
    { id: 18, name: '焼肉・ステーキ' },
    { id: 19, name: 'ブッフェ' },
    { id: 20, name: 'ラウンジ' },
    { id: 21, name: 'バー' },
    { id: 22, name: 'ワインバー' },
    { id: 23, name: 'その他' }
  ]
end
