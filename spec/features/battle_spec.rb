require "./spec/spec_helper.rb"

feature 'battle_spec tests' do
  feature 'Enter names' do
    scenario 'submitting names' do
      sign_in_and_play
      expect(page).to have_content 'Bob vs Marley!!'
    end
  end

  feature 'view hit points' do
    scenario 'player 1 can see player 2 hit points' do
      sign_in_and_play
      expect(page).to have_content 'Marley has 100 hit points'
    end

    scenario 'player 2 can see player 1 hit points' do
      sign_in_and_play
      expect(page).to have_content 'Bob has 100 hit points'
    end
  end

  feature 'attacking' do
    scenario 'player 1 attacks player 2 and gets a confirmation' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Marley has been attacked'
    end


      scenario 'player 1 reduces player 2\'s hit points by 10' do
        sign_in_and_play
        click_button 'Attack'
        expect(page).to have_content 'Marley: 90 HP'
      end

      scenario 'player 2 attacks player 1 and gets a confirmation' do
        sign_in_and_play
        click_button 'Attack'
        click_button 'Next turn'
        click_button 'Attack'
        expect(page).to have_content 'Bob has been attacked'
        expect(page).to have_content 'Bob: 90 HP'
      end


  end

  feature 'switching turns' do
    scenario 'switching turns' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Next turn'
      expect(Game.the_game.current_turn.name).to eq 'Marley'
      expect(page).to have_content 'Bob vs Marley!!'
    end
  end

  feature 'winnning the game' do
    scenario 'Bob wins when Marley is dead' do
      sign_in_and_play
      18.times do
        click_button 'Attack'
        click_button 'Next turn'
      end
      click_button 'Attack'
      expect(page).to have_content 'Bob won'
    end
  end
end