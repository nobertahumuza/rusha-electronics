$f = "C:\Users\Administrator\Desktop\rusha-electronics\public\index.html"
$c = Get-Content $f -Raw

# 1. REPLACE "Leave Your Feedback" button with actual feedback form
$oldForm = '            <div class="text-center mt-10 fade-in">
                <a href="#order" class="inline-flex items-center gap-2 bg-brand-600 text-white font-bold px-6 py-3 rounded-xl hover:bg-brand-700 transition-all shadow-lg">
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z"/></svg>
                    Leave Your Feedback
                </a>
            </div>
        </div>
    </section>'

$newForm = '            <div class="mt-12 fade-in">
                <h3 class="text-2xl font-bold text-center text-gray-900 mb-6">Share Your Experience!</h3>
                <div class="max-w-lg mx-auto bg-brand-50 rounded-2xl p-6 border border-brand-100">
                    <form id="feedbackForm" onsubmit="submitFeedback(event)">
                        <div class="mb-4">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Your Name *</label>
                            <input type="text" id="fbName" required class="w-full px-4 py-3 rounded-xl border-2 border-gray-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none" placeholder="Your full name">
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Your Role *</label>
                            <select id="fbRole" required class="w-full px-4 py-3 rounded-xl border-2 border-gray-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none bg-white">
                                <option value="">Select...</option>
                                <option value="Bishop Stuart Student">Bishop Stuart Student</option>
                                <option value="Kakoba Resident">Kakoba Resident</option>
                                <option value="Local Business">Local Business</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Rating *</label>
                            <div class="flex gap-2" id="ratingStars">
                                <button type="button" class="text-2xl text-gray-300 hover:text-yellow-400 transition" onclick="setRating(1)">★</button>
                                <button type="button" class="text-2xl text-gray-300 hover:text-yellow-400 transition" onclick="setRating(2)">★</button>
                                <button type="button" class="text-2xl text-gray-300 hover:text-yellow-400 transition" onclick="setRating(3)">★</button>
                                <button type="button" class="text-2xl text-gray-300 hover:text-yellow-400 transition" onclick="setRating(4)">★</button>
                                <button type="button" class="text-2xl text-gray-300 hover:text-yellow-400 transition" onclick="setRating(5)">★</button>
                            </div>
                            <input type="hidden" id="fbRating" value="0">
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Your Feedback *</label>
                            <textarea rows="4" id="fbMessage" required class="w-full px-4 py-3 rounded-xl border-2 border-gray-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none resize-none" placeholder="Tell us about your experience..."></textarea>
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Email (optional)</label>
                            <input type="email" id="fbEmail" class="w-full px-4 py-3 rounded-xl border-2 border-gray-200 focus:border-brand-500 focus:ring-2 focus:ring-brand-200 outline-none" placeholder="your@email.com">
                        </div>
                        <button type="submit" class="w-full bg-brand-600 text-white font-bold py-3 rounded-xl hover:bg-brand-700 transition-all shadow-lg">
                            <svg class="w-5 h-5 inline mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"/></svg>
                            Submit Feedback
                        </button>
                        <p id="feedbackMsg" class="text-center text-green-600 font-semibold mt-3 hidden">Thank you! Your feedback has been submitted.</p>
                    </form>
                </div>
            </div>
        </div>
    </section>'

$c = $c.Replace($oldForm, $newForm)

# 2. ADD MORE TESTIMONIALS - add 3 more cards after the last one
$anchor = '                            <div class="text-gray-400 text-xs">Bishop Stuart Student</div>
                        </div>
                    </div>
                </div>
                <div class="bg-brand-50 rounded-2xl p-6 border border-brand-100 hover:shadow-lg transition-all">
                    <div class="flex gap-1 mb-3">
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    </div>
                    <p class="text-gray-700 italic leading-relaxed mb-4">"Bought my Samsung Galaxy A56 here and got a 10% student discount! The phone was in perfect condition. Best shop near campus!"</p>
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-brand-200 rounded-full flex items-center justify-center text-brand-700 font-bold text-sm">A</div>
                        <div>
                            <div class="font-semibold text-gray-900 text-sm">Anna K.</div>
                            <div class="text-gray-400 text-xs">Bishop Stuart University</div>
                        </div>
                    </div>
                </div>
                <div class="bg-brand-50 rounded-2xl p-6 border border-brand-100 hover:shadow-lg transition-all">
                    <div class="flex gap-1 mb-3">
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    </div>
                    <p class="text-gray-700 italic leading-relaxed mb-4">"Bought my charger and earphones here. Cheapest prices in Mbarara! The owner is so kind and always helps students find what they need."</p>
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-brand-200 rounded-full flex items-center justify-center text-brand-700 font-bold text-sm">M</div>
                        <div>
                            <div class="font-semibold text-gray-900 text-sm">Mary B.</div>
                            <div class="text-gray-400 text-xs">Bishop Stuart Student</div>
                        </div>
                    </div>
                </div>
                <div class="bg-brand-50 rounded-2xl p-6 border border-brand-100 hover:shadow-lg transition-all">
                    <div class="flex gap-1 mb-3">
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                        <svg class="w-4 h-4 text-yellow-400" fill="currentColor" viewBox="0 0 20 20"><path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"/></svg>
                    </div>
                    <p class="text-gray-700 italic leading-relaxed mb-4">"The earphones I bought here sound amazing and the price was fair. Always buying from Rusha - best electronics shop in Kakoba!"</p>
                    <div class="flex items-center gap-3">
                        <div class="w-10 h-10 bg-brand-200 rounded-full flex items-center justify-center text-brand-700 font-bold text-sm">D</div>
                        <div>
                            <div class="font-semibold text-gray-900 text-sm">David W.</div>
                            <div class="text-gray-400 text-xs">Bishop Stuart Student</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center mt-10 fade-in">'

$c = $c.Replace($anchor, $newTestimonials)

# 3. ADD JAVASCRIPT for feedback form and star rating at the end of the file
$jsCode = '
        // Feedback Form Submission
        function submitFeedback(e) {
            e.preventDefault();
            const name = document.getElementById("fbName").value;
            const role = document.getElementById("fbRole").value;
            const rating = document.getElementById("fbRating").value;
            const message = document.getElementById("fbMessage").value;
            const email = document.getElementById("fbEmail").value;
            
            if (!name || !role || !message || rating === "0") {
                alert("Please fill in all required fields and select a rating.");
                return;
            }
            
            // Build WhatsApp message with feedback
            const msg = encodeURIComponent(`New feedback from ${name} (${role})!
Rating: ${"★".repeat(rating)}${"☆".repeat(5-rating)}
Message: ${message}
Email: ${email || "N/A"}`);
            
            // Show success message
            document.getElementById("feedbackMsg").classList.remove("hidden");
            document.getElementById("feedbackForm").reset();
            document.getElementById("fbRating").value = "0";
            document.querySelectorAll("#ratingStars button").forEach(b => b.classList.remove("text-yellow-400"));
            document.querySelectorAll("#ratingStars button").forEach(b => b.classList.add("text-gray-300"));
            
            // Also send to WhatsApp
            window.open(`https://wa.me/256785759187?text=${msg}`, "_blank");
        }
        
        function setRating(n) {
            document.getElementById("fbRating").value = n;
            const stars = document.querySelectorAll("#ratingStars button");
            stars.forEach((star, i) => {
                if (i < n) {
                    star.classList.remove("text-gray-300");
                    star.classList.add("text-yellow-400");
                } else {
                    star.classList.remove("text-yellow-400");
                    star.classList.add("text-gray-300");
                }
            });
        }
    </script>'

# Find the end of script tag and add the new functions before closing tag
$c = $c.Replace("</script>", $jsCode)

Set-Content $f $c
Write-Host "Badges removed, feedback form added, more testimonials added!" -ForegroundColor Green
