require 'rails_helper'

RSpec.describe Bucket, type: :model do

	describe 'attributes' do
		it { should belong_to(:user) }
		it { should respond_to :title }
		it { should respond_to :description }
		it { should respond_to :completed }
	end

	describe 'class methods' do 
		before(:each) do
			@bucket1 = Bucket.create(title: 'Travel', description: 'Europe', completed: 'yes')
			@bucket2 = Bucket.create(title: 'Shopping', description: 'Grocery', completed: 'maybe')
			@bucket3 = Bucket.create(title: 'Marathons', description: 'Salt Lake', completed: 'no')
		end 

		it 'sorts by title' do 
			bucket = Bucket.by_title
			expect(bucket).to eq([@bucket3, @bucket2, @bucket1])
		end 
	
		it 'sorts by description' do 
			bucket = Bucket.by_description
			expect(bucket).to eq([@bucket1, @bucket2, @bucket3])
		end 

		it 'sorts by completed' do 
			bucket = Bucket.by_completed 
			expect(bucket).to eq([@bucket2, @bucket3, @bucket1])
		end
	end  
end